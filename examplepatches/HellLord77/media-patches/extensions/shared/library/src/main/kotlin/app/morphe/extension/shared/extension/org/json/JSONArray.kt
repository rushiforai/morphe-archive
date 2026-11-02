package app.morphe.extension.shared.extension.org.json

import org.json.JSONArray
import org.json.JSONObject

inline operator fun <reified T> JSONArray.iterator(): Iterator<T> =
    object : Iterator<T> {
        private var index = 0

        override fun next(): T {
            if (!hasNext()) throw NoSuchElementException()
            return get(index++) as T
        }

        override fun hasNext() = index < length()
    }

inline fun <reified T> JSONArray.iterable() = Iterable { iterator<T>() }

fun JSONArray.objects() = iterable<JSONObject>()
