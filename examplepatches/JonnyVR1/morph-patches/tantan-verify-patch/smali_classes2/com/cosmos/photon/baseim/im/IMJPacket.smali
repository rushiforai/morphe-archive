.class public Lcom/cosmos/photon/baseim/im/IMJPacket;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;
.implements Lcom/cosmos/photon/baseim/im/IPacket;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/cosmos/photon/baseim/im/IMJPacket;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private AT:Ljava/lang/String;

.field private AT_TEXT:Ljava/lang/String;

.field private Action:Ljava/lang/String;

.field private From:Ljava/lang/String;

.field private ID:Ljava/lang/String;

.field private NameSpace:Ljava/lang/String;

.field private Text:Ljava/lang/String;

.field private TextV2:Ljava/lang/String;

.field private To:Ljava/lang/String;

.field private Type:Ljava/lang/String;

.field private _Type:Ljava/lang/String;

.field protected jsonObj:Lorg/json/JSONObject;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/cosmos/photon/baseim/im/IMJPacket$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/cosmos/photon/baseim/im/IMJPacket$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/cosmos/photon/baseim/im/IMJPacket;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    const-string v0, "_"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Action:Ljava/lang/String;

    .line 75
    const-string v0, "id"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->ID:Ljava/lang/String;

    .line 76
    const-string v0, "_t"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->_Type:Ljava/lang/String;

    .line 77
    const-string v0, "ns"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->NameSpace:Ljava/lang/String;

    .line 78
    const-string v0, "fr"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->From:Ljava/lang/String;

    .line 79
    const-string v0, "to"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->To:Ljava/lang/String;

    .line 80
    const-string v0, "text"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Text:Ljava/lang/String;

    .line 81
    const-string v0, "at"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->AT:Ljava/lang/String;

    .line 82
    const-string v0, "attext"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->AT_TEXT:Ljava/lang/String;

    .line 83
    const-string v0, "textv2"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->TextV2:Ljava/lang/String;

    .line 84
    const-string v0, "type"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Type:Ljava/lang/String;

    .line 85
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "_"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Action:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "id"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->ID:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "_t"

    .line 13
    .line 14
    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->_Type:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "ns"

    .line 17
    .line 18
    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->NameSpace:Ljava/lang/String;

    .line 19
    .line 20
    const-string v0, "fr"

    .line 21
    .line 22
    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->From:Ljava/lang/String;

    .line 23
    .line 24
    const-string v0, "to"

    .line 25
    .line 26
    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->To:Ljava/lang/String;

    .line 27
    .line 28
    const-string v0, "text"

    .line 29
    .line 30
    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Text:Ljava/lang/String;

    .line 31
    .line 32
    const-string v0, "at"

    .line 33
    .line 34
    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->AT:Ljava/lang/String;

    .line 35
    .line 36
    const-string v0, "attext"

    .line 37
    .line 38
    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->AT_TEXT:Ljava/lang/String;

    .line 39
    .line 40
    const-string v0, "textv2"

    .line 41
    .line 42
    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->TextV2:Ljava/lang/String;

    .line 43
    .line 44
    const-string v0, "type"

    .line 45
    .line 46
    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Type:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 53
    .line 54
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    :catch_0
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    const-string v0, "_"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Action:Ljava/lang/String;

    .line 88
    const-string v0, "id"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->ID:Ljava/lang/String;

    .line 89
    const-string v0, "_t"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->_Type:Ljava/lang/String;

    .line 90
    const-string v0, "ns"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->NameSpace:Ljava/lang/String;

    .line 91
    const-string v0, "fr"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->From:Ljava/lang/String;

    .line 92
    const-string v0, "to"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->To:Ljava/lang/String;

    .line 93
    const-string v0, "text"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Text:Ljava/lang/String;

    .line 94
    const-string v0, "at"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->AT:Ljava/lang/String;

    .line 95
    const-string v0, "attext"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->AT_TEXT:Ljava/lang/String;

    .line 96
    const-string v0, "textv2"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->TextV2:Ljava/lang/String;

    .line 97
    const-string v0, "type"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Type:Ljava/lang/String;

    .line 98
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 1

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const-string v0, "_"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Action:Ljava/lang/String;

    .line 62
    const-string v0, "id"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->ID:Ljava/lang/String;

    .line 63
    const-string v0, "_t"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->_Type:Ljava/lang/String;

    .line 64
    const-string v0, "ns"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->NameSpace:Ljava/lang/String;

    .line 65
    const-string v0, "fr"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->From:Ljava/lang/String;

    .line 66
    const-string v0, "to"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->To:Ljava/lang/String;

    .line 67
    const-string v0, "text"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Text:Ljava/lang/String;

    .line 68
    const-string v0, "at"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->AT:Ljava/lang/String;

    .line 69
    const-string v0, "attext"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->AT_TEXT:Ljava/lang/String;

    .line 70
    const-string v0, "textv2"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->TextV2:Ljava/lang/String;

    .line 71
    const-string v0, "type"

    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Type:Ljava/lang/String;

    .line 72
    iput-object p1, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    return-void
.end method

.method public static init(Lorg/json/JSONObject;)Lcom/cosmos/photon/baseim/im/IMJPacket;
    .locals 1
    .param p0    # Lorg/json/JSONObject;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lcom/cosmos/photon/baseim/im/IMJPacket;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/cosmos/photon/baseim/im/IMJPacket;-><init>(Lorg/json/JSONObject;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static parseFromJson(Ljava/lang/String;)Lcom/cosmos/photon/baseim/im/IMJPacket;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/cosmos/photon/baseim/im/IMJPacket;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/cosmos/photon/baseim/im/IMJPacket;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    new-instance p0, Lorg/json/JSONException;

    .line 14
    .line 15
    const-string v0, "json string is empty."

    .line 16
    .line 17
    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    throw p0
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getATPeople()[Ljava/lang/String;
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->AT:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->AT:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    new-array v1, v0, [Ljava/lang/String;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    :goto_0
    if-ge v2, v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    aput-object v3, v1, v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    add-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-object v1

    .line 42
    :catch_0
    :cond_1
    const/4 p0, 0x0

    .line 43
    return-object p0
.end method

.method public getATtext()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->AT_TEXT:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAction()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Action:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getBody()[B
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/cosmos/photon/baseim/im/IMJPacket;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getBoolean(Ljava/lang/String;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getDouble(Ljava/lang/String;)D
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public getFrom()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->From:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->ID:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getInt(Ljava/lang/String;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getJSONObject()Lorg/json/JSONObject;
    .locals 0

    .line 8
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    return-object p0
.end method

.method public getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLong(Ljava/lang/String;)J
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public getNameSpace()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->NameSpace:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPacketLen()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/cosmos/photon/baseim/im/IMJPacket;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    array-length p0, p0

    .line 10
    return p0
.end method

.method public getSType()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Text:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTextV2()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->TextV2:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTo()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->To:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getType()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->_Type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public has(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public hasBody()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Text:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public opt(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public optBoolean(Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/cosmos/photon/baseim/im/IMJPacket;->optBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public optBoolean(Ljava/lang/String;Z)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public optDouble(Ljava/lang/String;)D
    .locals 2

    .line 1
    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lcom/cosmos/photon/baseim/im/IMJPacket;->optDouble(Ljava/lang/String;D)D

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public optDouble(Ljava/lang/String;D)D
    .locals 0

    .line 8
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2, p3}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide p0

    return-wide p0
.end method

.method public optInt(Ljava/lang/String;)I
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/cosmos/photon/baseim/im/IMJPacket;->optInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public optInt(Ljava/lang/String;I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/baseim/im/IMJPacket;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p1, p0, Lorg/json/JSONObject;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    check-cast p0, Lorg/json/JSONObject;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public optLong(Ljava/lang/String;)J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lcom/cosmos/photon/baseim/im/IMJPacket;->optLong(Ljava/lang/String;J)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public optLong(Ljava/lang/String;J)J
    .locals 0

    .line 8
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2, p3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide p0

    return-wide p0
.end method

.method public optString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/cosmos/photon/baseim/im/IMJPacket;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 8
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public put(Ljava/lang/String;D)Lorg/json/JSONObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 21
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public put(Ljava/lang/String;I)Lorg/json/JSONObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 22
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public put(Ljava/lang/String;J)Lorg/json/JSONObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 23
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    instance-of v0, p2, Lcom/cosmos/photon/baseim/im/IMJPacket;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p2, Lcom/cosmos/photon/baseim/im/IMJPacket;

    .line 8
    .line 9
    iget-object p2, p2, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 24
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public read(Lcom/cosmos/photon/baseim/im/IMJPacket;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/lang/String;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Lcom/cosmos/photon/baseim/im/IMJPacket;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public setATPeople(Lorg/json/JSONArray;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->AT:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    return-void
.end method

.method public setAction(Ljava/lang/String;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Action:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->From:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->ID:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    return-void
.end method

.method public setSType(Ljava/lang/Object;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->Text:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    return-void
.end method

.method public setTo(Ljava/lang/String;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->To:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    return-void
.end method

.method public setType(Ljava/lang/Object;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->_Type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/cosmos/photon/baseim/im/IMJPacket;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/IMJPacket;->jsonObj:Lorg/json/JSONObject;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "{}"

    .line 11
    .line 12
    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/cosmos/photon/baseim/im/IMJPacket;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
