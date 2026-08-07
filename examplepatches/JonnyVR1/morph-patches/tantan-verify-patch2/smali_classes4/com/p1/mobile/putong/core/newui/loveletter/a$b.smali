.class public Lcom/p1/mobile/putong/core/newui/loveletter/a$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/loveletter/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:Ljava/lang/String;

.field public c:I

.field public d:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;->a:I

    const/4 p1, 0x2

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;->c:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;->c:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;->b:Ljava/lang/String;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;->a:I

    .line 11
    .line 12
    return-void
.end method
