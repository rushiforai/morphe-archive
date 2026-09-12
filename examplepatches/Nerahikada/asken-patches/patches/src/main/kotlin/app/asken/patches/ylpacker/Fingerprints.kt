package app.asken.patches.ylpacker

import app.morphe.patcher.Fingerprint

object YlpackerAFingerprint : Fingerprint(definingClass = "Lcom/yl/pack/YLPacker;", name = "a", returnType = "Ljava/lang/String;", parameters = listOf("Ljava/lang/String;"))
object YlpackerBFingerprint : Fingerprint(definingClass = "Lcom/yl/pack/YLPacker;", name = "b", returnType = "Ljava/lang/String;", parameters = listOf("Ljava/lang/String;"))
object YlpackerClinitFingerprint : Fingerprint(definingClass = "Lcom/yl/pack/YLPacker;", name = "<clinit>", returnType = "V", parameters = listOf())
