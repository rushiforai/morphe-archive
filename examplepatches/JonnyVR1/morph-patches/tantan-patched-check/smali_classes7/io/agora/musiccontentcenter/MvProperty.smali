.class public Lio/agora/musiccontentcenter/MvProperty;
.super Ljava/lang/Object;


# instance fields
.field public bandwidth:Ljava/lang/String;

.field public resolution:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/agora/musiccontentcenter/MvProperty;->bandwidth:Ljava/lang/String;

    iput-object p2, p0, Lio/agora/musiccontentcenter/MvProperty;->resolution:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getBandwidth()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/musiccontentcenter/MvProperty;->bandwidth:Ljava/lang/String;

    return-object p0
.end method

.method public getResolution()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/musiccontentcenter/MvProperty;->resolution:Ljava/lang/String;

    return-object p0
.end method
