.class public final Lcom/opera/android/browser/chromium/OperaBrowserContext;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Lj4c;


# instance fields
.field public final a:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lkw3;

    const/16 v1, 0x15

    invoke-direct {v0, v1}, Lkw3;-><init>(B)V

    new-instance v1, Lj4c;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lj4c;-><init>(Lesk;B)V

    sput-object v1, Lcom/opera/android/browser/chromium/OperaBrowserContext;->b:Lj4c;

    return-void
.end method

.method public constructor <init>(Z)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/opera/android/browser/chromium/OperaBrowserContext;->a:Z

    return-void
.end method

.method public static shouldDiscardSessionCookiesAtStartup(Z)Z
    .registers 1

    if-nez p0, :cond_12

    sget-object p0, Lcom/opera/android/browser/chromium/OperaBrowserContext;->b:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_12

    const/4 p0, 0x0

    return p0

    :cond_12
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public final isOffTheRecord()Z
    .registers 1

    iget-boolean p0, p0, Lcom/opera/android/browser/chromium/OperaBrowserContext;->a:Z

    return p0
.end method
