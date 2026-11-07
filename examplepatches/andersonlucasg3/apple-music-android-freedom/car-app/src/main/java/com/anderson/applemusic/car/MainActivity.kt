package com.anderson.applemusic.car

import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import android.os.Bundle

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            AppleMusicCarTheme {
                CarApp()
            }
        }
    }
}
