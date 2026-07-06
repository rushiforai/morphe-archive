package com.dumbsoftware.t2c.util

import app.morphe.patcher.patch.ResourcePatchContext

fun ResourcePatchContext.updateEnvVariables(
    fileNames: List<String>,
    updates: Map<String, String>
) {
    fileNames.forEach { fileName ->
        val envFile = get("assets/flutter_assets/$fileName") ?: return@forEach
        
        var content = envFile.readText()
        
        updates.forEach { (key, value) ->
            val regex = Regex("^$key=.*", RegexOption.MULTILINE)
            content = if (content.contains(regex)) {
                content.replace(regex, "$key=$value")
            } else {
                if (content.endsWith("\n") || content.isEmpty()) {
                    content + "$key=$value\n"
                } else {
                    content + "\n$key=$value\n"
                }
            }
        }
        
        envFile.writeText(content)
    }
}
