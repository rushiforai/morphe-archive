.class public Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$TextContent;
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
    name = "TextContent"
.end annotation


# instance fields
.field final textResId:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;-><init>(I)V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$TextContent;->textResId:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getContent()Ljava/lang/CharSequence;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$TextContent;->textResId:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
