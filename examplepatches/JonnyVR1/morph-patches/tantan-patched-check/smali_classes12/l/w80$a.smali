.class public Ll/w80$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/w80;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private content:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "content"
    .end annotation
.end field

.field private isFaceTrack:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "isFaceTrack"
    .end annotation
.end field

.field private triggerTip:Ll/zjj0;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "triggerTip"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
