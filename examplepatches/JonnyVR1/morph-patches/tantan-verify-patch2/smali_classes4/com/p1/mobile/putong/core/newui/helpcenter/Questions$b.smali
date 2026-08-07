.class public abstract Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/helpcenter/Questions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "b"
.end annotation


# static fields
.field public static final TYPE_IMAGE:I = 0x1

.field public static final TYPE_TEXT:I = 0x0

.field public static final TYPE_TITLE:I = 0x2


# instance fields
.field final type:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->type:I

    .line 5
    .line 6
    return-void
.end method

.method public static image(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$ImageContent;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$ImageContent;-><init>(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$TextContent;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$TextContent;-><init>(II)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public static title(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$TextContent;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$TextContent;-><init>(II)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method


# virtual methods
.method public abstract getContent()Ljava/lang/CharSequence;
.end method

.method public getType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->type:I

    .line 2
    .line 3
    return p0
.end method
