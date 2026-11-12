.class public final Lggf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# static fields
.field public static final synthetic e:I


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lt88;

.field public final c:La98;

.field public final d:Ls88;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lt88;La98;Ls88;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lggf;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lggf;->b:Lt88;

    iput-object p3, p0, Lggf;->c:La98;

    iput-object p4, p0, Lggf;->d:Ls88;

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 5

    iget-object v0, p0, Lggf;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v0

    new-instance v1, Lrf4;

    const/16 v2, 0xe

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p0}, Lrf4;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p0, 0x3

    invoke-static {v0, v3, v3, v1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method
