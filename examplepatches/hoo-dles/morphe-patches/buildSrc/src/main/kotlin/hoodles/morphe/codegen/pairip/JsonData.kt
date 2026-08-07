/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.codegen.pairip

import kotlinx.serialization.Serializable

@Serializable
data class Field(val name: String, val value: String)

@Serializable
data class JsonData(
    val strings: Map<String, List<Field>>,
    val methods: Map<String, List<Field>>
)
