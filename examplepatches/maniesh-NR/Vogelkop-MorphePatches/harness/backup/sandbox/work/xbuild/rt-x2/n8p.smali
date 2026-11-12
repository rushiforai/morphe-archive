.class public final Ln8p;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lm8p;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final g:Lu9d;

.field public final h:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lm8p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ln8p;->Companion:Lm8p;

    return-void
.end method

.method public synthetic constructor <init>()V
    .registers 3

    .line 37
    invoke-direct {p0}, Lp8p;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Ln8p;->g:Lu9d;

    new-instance v0, Lqqo;

    const/16 v1, 0xe

    invoke-direct {v0, p0, v1}, Lqqo;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Ln8p;->h:Lzyk;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lu9d;)V
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "wvvm_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1, v1}, Lkotlin/text/StringsKt;->T(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lp8p;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Ln8p;->g:Lu9d;

    new-instance p1, Lqqo;

    const/16 p2, 0xe

    invoke-direct {p1, p0, p2}, Lqqo;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ln8p;->h:Lzyk;

    return-void
.end method


# virtual methods
.method public final b()Ljava/lang/Object;
    .registers 1

    iget-object p0, p0, Ln8p;->h:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt0i;

    iget-object p0, p0, Lt0i;->a:Ljava/lang/Object;

    return-object p0
.end method
