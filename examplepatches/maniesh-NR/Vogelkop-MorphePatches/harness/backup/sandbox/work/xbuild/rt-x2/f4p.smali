.class public abstract Lf4p;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Le4p;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Ll4c;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Le4p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lf4p;->Companion:Le4p;

    sget-object v0, Lf7c;->b:Lf7c;

    sget-object v1, Lxvo;->k:Lxvo;

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    sput-object v0, Lf4p;->a:Ll4c;

    return-void
.end method
