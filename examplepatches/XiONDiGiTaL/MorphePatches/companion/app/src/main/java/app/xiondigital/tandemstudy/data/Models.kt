package app.xiondigital.tandemstudy.data

data class WordItem(
    val word: String,
    val lang: String,
    val hits: Int,
    val lastSeen: Long,
    val dueAt: Long,
    val known: Boolean,
)

data class SearchHit(
    val id: Long,
    val partner: String,
    val body: String,
    val at: Long,
    val isMine: Boolean,
)

data class ConversationStat(
    val partner: String,
    val messages: Int,
    val mine: Int,
    val medianReplyMs: Long?,
)

data class ImportSummary(
    val conversations: Int,
    val messages: Int,
    val newWords: Int,
    val files: Int,
    val language: String?,
    val note: String?,
)

data class Stats(
    val messages: Int,
    val conversations: Int,
    val words: Int,
    val wordHits: Int,
    val mineShare: Double,
    val days: List<Pair<Long, Int>>,
    val topWords: List<WordItem>,
    val perConversation: List<ConversationStat>,
    val hasDirection: Boolean,
)
