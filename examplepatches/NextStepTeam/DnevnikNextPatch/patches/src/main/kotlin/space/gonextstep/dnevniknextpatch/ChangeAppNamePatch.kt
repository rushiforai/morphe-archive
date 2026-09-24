package space.gonextstep.dnevniknextpatch

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import java.io.FileWriter
import java.nio.file.Files

@Suppress("unused")
val changeAppNamePatch = resourcePatch(
    name = "Смена названия приложения",
    description = "Изменяет название приложения на указанное в настройках патча",
    default = true
) {
    // Опция для ввода своего названия
    val appNameOption = stringOption(
        key = "appName",
        default = "Дневник NP",
        values = mapOf(
            "Дневник NP" to "Дневник NP",
            "МЭШ" to "МЭШ",
            "Дневник МЭШ" to "Дневник МЭШ"
        ),
        title = "Название приложения",
        description = "Введите название, которое будет отображаться в лаунчере",
        required = true
    )

    execute {
        val appName = appNameOption.value ?: "Дневник NP"
        println("✅ Патч 'Смена названия' применен! Новое имя: $appName")
        
        try {
            // Получаем директорию с ресурсами
            val resDirectory = get("res")
            
            // Создаем папку values-v24 (если нет)
            val valuesV24Directory = resDirectory.resolve("values")
            if (!valuesV24Directory.isDirectory) {
                Files.createDirectories(valuesV24Directory.toPath())
            }
            
            val stringsXml = valuesV24Directory.resolve("strings.xml")
            
            // Создаем файл strings.xml если его нет
            if (!stringsXml.exists()) {
                FileWriter(stringsXml).use {
                    it.write("<?xml version=\"1.0\" encoding=\"utf-8\"?><resources></resources>")
                }
            }
            
            // Обновляем или добавляем запись app_name
            document("res/values/strings.xml").use { document ->
                val resourcesElement = document.getElementsByTagName("resources").item(0)
                
                // Удаляем старую запись если есть
                val existingElements = document.getElementsByTagName("string")
                for (i in 0 until existingElements.length) {
                    val element = existingElements.item(i)
                    if (element.attributes.getNamedItem("name")?.textContent == "app_name") {
                        resourcesElement.removeChild(element)
                        break
                    }
                }
                
                // Добавляем новую запись
                val stringElement = document.createElement("string")
                stringElement.setAttribute("name", "app_name")
                stringElement.textContent = appName
                resourcesElement.appendChild(stringElement)
            }
            
            println("✅ Название приложения изменено на: $appName")
        } catch (e: Exception) {
            println("⚠️ Ошибка при смене названия: ${e.message}")
            e.printStackTrace()
        }
    }
}