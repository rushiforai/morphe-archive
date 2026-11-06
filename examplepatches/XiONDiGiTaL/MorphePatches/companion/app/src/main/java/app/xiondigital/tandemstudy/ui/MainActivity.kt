package app.xiondigital.tandemstudy.ui

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent

class MainActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            StudyTheme {
                App(openReview = intent.getBooleanExtra(EXTRA_OPEN_REVIEW, false))
            }
        }
    }

    companion object {
        const val EXTRA_OPEN_REVIEW = "open_review"
    }
}
