.class public Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/helpcenter/Questions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Question"
.end annotation


# instance fields
.field private final contents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;",
            ">;"
        }
    .end annotation
.end field

.field private final id:Ljava/lang/String;

.field private final titleResId:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;->id:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;->titleResId:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;->contents:Ljava/util/List;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getContents()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;->contents:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;->titleResId:I

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
