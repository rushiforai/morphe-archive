.class public Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$ImageContent;
.super Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/helpcenter/Questions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ImageContent"
.end annotation


# instance fields
.field final url:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;-><init>(I)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$ImageContent;->url:Ljava/lang/CharSequence;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getContent()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$ImageContent;->url:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method
