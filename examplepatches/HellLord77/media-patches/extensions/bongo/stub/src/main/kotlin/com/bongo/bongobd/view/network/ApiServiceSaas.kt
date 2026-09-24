package com.bongo.bongobd.view.network

import com.bongo.bongobd.view.model.ContentDetailsResponse
import retrofit2.Response

interface ApiServiceSaas {
    suspend fun getContentDetails(bongoId: String?): Response<ContentDetailsResponse>
}