.class public Lcom/momo/rtcbase/SessionDescription;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/SessionDescription$Type;
    }
.end annotation


# instance fields
.field public final description:Ljava/lang/String;

.field public final type:Lcom/momo/rtcbase/SessionDescription$Type;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/SessionDescription$Type;Ljava/lang/String;)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/SessionDescription;->type:Lcom/momo/rtcbase/SessionDescription$Type;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/momo/rtcbase/SessionDescription;->description:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/SessionDescription;->description:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTypeInCanonicalForm()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/SessionDescription;->type:Lcom/momo/rtcbase/SessionDescription$Type;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/rtcbase/SessionDescription$Type;->canonicalForm()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
