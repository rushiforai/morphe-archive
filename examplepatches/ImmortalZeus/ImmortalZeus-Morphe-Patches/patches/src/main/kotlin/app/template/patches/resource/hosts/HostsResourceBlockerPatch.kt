package app.template.patches.resource.hosts

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import java.io.File
import java.util.logging.Logger
import org.w3c.dom.Element
import org.w3c.dom.Node

const val DEFAULT_REDIRECTION_IP = "0.0.0.0"

@Suppress("unused")
val hostsResourceBlockerPatch = resourcePatch(
    name = "Block hosts in string resources",
    description = "Blocks ads and trackers by replacing hosts in XML string resources. " +
        "Works alongside bytecode hosts blocker for comprehensive coverage.",
    default = false
) {
    val hostsOption by stringOption(
        key = "hosts",
        default = null,
        title = "Hosts file",
        description = "The hosts file containing hosts or domains you want to block.",
        required = true
    ) { filePath ->
        !filePath.isNullOrEmpty() && File(filePath.trim()).isFile
    }

    val redirectionIpOption by stringOption(
        key = "redirectionIp",
        default = DEFAULT_REDIRECTION_IP,
        values = mapOf(
            "Default" to DEFAULT_REDIRECTION_IP,
            "localhost" to "127.0.0.1"
        ),
        title = "Redirection IP",
        description = "The IP address to redirect blocked domains to.",
    ) { ipAddress ->
        val ipAddressPattern = """^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$""".toRegex()
        !ipAddress.isNullOrEmpty() && ipAddress.matches(ipAddressPattern)
    }

    val isWildcardOption by booleanOption(
        key = "isWildcard",
        default = true,
        title = "Wildcard blocking",
        description = "Enable subdomain matching.",
    )

    execute {
        val hostsFile = File(hostsOption!!.trim())
        val hostsBlocker = HostsBlocker.fromFile(hostsFile)
        val redirectionIp = redirectionIpOption!!
        val wildcard = isWildcardOption!!

        val logger = Logger.getLogger(this::class.java.name)
        var replacedCount = 0

        val languageCodes = listOf(
            "", "en", "es", "fr", "de", "it", "pt", "ru", "zh", "ja", "ko",
            "ar", "hi", "nl", "pl", "tr", "vi", "th", "id", "ms", "sv",
            "da", "fi", "no", "cs", "el", "he", "hu", "ro", "sk", "uk"
        )

        val resourcePaths = mutableListOf<String>()

        for (lang in languageCodes) {
            val prefix = if (lang.isEmpty()) "values" else "values-$lang"
            resourcePaths.add("res/$prefix/strings.xml")
        }

        resourcePaths.addAll(listOf(
            "res/values/strings.xml",
            "res/xml/network_security_config.xml",
            "res/xml/network_security_config.xml",
        ))

        val processedPaths = mutableSetOf<String>()

        for (filePath in resourcePaths) {
            if (filePath in processedPaths) continue
            processedPaths.add(filePath)

            try {
                val doc = document(filePath) ?: continue

                if (filePath.contains("strings.xml")) {
                    replacedCount += processStringsDocument(
                        doc, filePath, hostsBlocker, redirectionIp, wildcard, logger
                    )
                } else {
                    replacedCount += processOtherXmlDocument(
                        doc, filePath, hostsBlocker, redirectionIp, wildcard, logger
                    )
                }
            } catch (e: Exception) {
                logger.warning("[ResourceBlocker] Error processing $filePath: ${e.message}")
            }
        }

        logger.info("[ResourceBlocker] Replaced $replacedCount resources containing blocked hosts.")

        hostsBlocker.close()
    }
}

private fun processStringsDocument(
    doc: org.w3c.dom.Document,
    filePath: String,
    hostsBlocker: HostsBlocker,
    replacementIp: String,
    wildcard: Boolean,
    logger: Logger,
): Int {
    var count = 0

    val stringNodes = doc.getElementsByTagName("string")
    for (i in 0 until stringNodes.length) {
        val node = stringNodes.item(i)
        val currentValue = node.textContent ?: continue

        if (currentValue.isBlank()) continue

        val extractedHost = HostsBlocker.extractHost(currentValue)
        if (extractedHost != null && hostsBlocker.isBlocked(extractedHost, wildcard)) {
            val newValue = hostsBlocker.findAndReplaceHost(currentValue, replacementIp)
            if (newValue != null && newValue != currentValue) {
                node.textContent = newValue
                count++
                logger.info("[ResourceBlocker] Replaced in $filePath: $extractedHost")
            }
        }
    }

    val arrayNodes = doc.getElementsByTagName("string-array")
    for (i in 0 until arrayNodes.length) {
        val arrayNode = arrayNodes.item(i)
        val itemNodes = arrayNode.childNodes
        for (j in 0 until itemNodes.length) {
            val itemNode = itemNodes.item(j)
            if (itemNode.nodeType == Node.TEXT_NODE) {
                val currentValue = itemNode.textContent ?: continue
                if (currentValue.isBlank()) continue

                val extractedHost = HostsBlocker.extractHost(currentValue)
                if (extractedHost != null && hostsBlocker.isBlocked(extractedHost, wildcard)) {
                    val newValue = hostsBlocker.findAndReplaceHost(currentValue, replacementIp)
                    if (newValue != null && newValue != currentValue) {
                        itemNode.textContent = newValue
                        count++
                        logger.info("[ResourceBlocker] Replaced in $filePath (string-array): $extractedHost")
                    }
                }
            }
        }
    }

    val pluralsNodes = doc.getElementsByTagName("plurals")
    for (i in 0 until pluralsNodes.length) {
        val pluralsNode = pluralsNodes.item(i)
        val itemNodes = pluralsNode.childNodes
        for (j in 0 until itemNodes.length) {
            val itemNode = itemNodes.item(j)
            if (itemNode.nodeName == "item") {
                val currentValue = itemNode.textContent ?: continue
                if (currentValue.isBlank()) continue

                val extractedHost = HostsBlocker.extractHost(currentValue)
                if (extractedHost != null && hostsBlocker.isBlocked(extractedHost, wildcard)) {
                    val newValue = hostsBlocker.findAndReplaceHost(currentValue, replacementIp)
                    if (newValue != null && newValue != currentValue) {
                        itemNode.textContent = newValue
                        count++
                        logger.info("[ResourceBlocker] Replaced in $filePath (plurals): $extractedHost")
                    }
                }
            }
        }
    }

    return count
}

private fun processOtherXmlDocument(
    doc: org.w3c.dom.Document,
    filePath: String,
    hostsBlocker: HostsBlocker,
    replacementIp: String,
    wildcard: Boolean,
    logger: Logger,
): Int {
    var count = 0

    val allElements = doc.getElementsByTagName("*")
    for (i in 0 until allElements.length) {
        val element = allElements.item(i) as? Element ?: continue

        val currentValue = element.textContent ?: continue
        if (currentValue.isBlank()) continue

        val extractedHost = HostsBlocker.extractHost(currentValue)
        if (extractedHost != null && hostsBlocker.isBlocked(extractedHost, wildcard)) {
            val newValue = hostsBlocker.findAndReplaceHost(currentValue, replacementIp)
            if (newValue != null && newValue != currentValue) {
                element.textContent = newValue
                count++
                logger.info("[ResourceBlocker] Replaced in $filePath: $extractedHost")
            }
        }

        for (attrIndex in 0 until element.attributes.length) {
            val attr = element.attributes.item(attrIndex)
            val attrValue = attr.nodeValue ?: continue

            if (attrValue.isBlank()) continue

            val extractedHost = HostsBlocker.extractHost(attrValue)
            if (extractedHost != null && hostsBlocker.isBlocked(extractedHost, wildcard)) {
                val newValue = hostsBlocker.findAndReplaceHost(attrValue, replacementIp)
                if (newValue != null && newValue != attrValue) {
                    element.setAttribute(attr.nodeName, newValue)
                    count++
                    logger.info("[ResourceBlocker] Replaced attr in $filePath: $extractedHost")
                }
            }
        }
    }

    return count
}