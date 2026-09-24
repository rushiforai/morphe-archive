package saas.ott.smarttv.ui.details.data

import retrofit2.Call
import saas.ott.smarttv.ui.details.model.ContentDetails

interface DetailsEndPoint {
    fun getVideoDetailsData(id: String): Call<ContentDetails>
}