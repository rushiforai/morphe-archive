.class public final Lldc;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Lf30;


# instance fields
.field public final a:Lcom/opera/android/crashhandler/OperaCrashKeys;

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/util/ArrayDeque;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lf30;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lf30;-><init>(B)V

    sput-object v0, Lldc;->d:Lf30;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/crashhandler/OperaCrashKeys;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lldc;->b:Ljava/lang/Object;

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lldc;->c:Ljava/util/ArrayDeque;

    iput-object p1, p0, Lldc;->a:Lcom/opera/android/crashhandler/OperaCrashKeys;

    return-void
.end method
