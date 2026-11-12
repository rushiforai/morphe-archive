.class public final Lz3l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljnf;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lz3l;->a:Lcom/opera/android/BrowserActivity;

    return-void
.end method


# virtual methods
.method public final a(Lx3l;)V
    .registers 3

    sget-object v0, Ly3l;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_1b

    const/4 v0, 0x1

    if-eq p1, v0, :cond_18

    const/4 v0, 0x2

    if-ne p1, v0, :cond_14

    sget-object p1, Lp6l;->b:Lp6l;

    goto :goto_1c

    :cond_14
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_18
    sget-object p1, Lp6l;->a:Lp6l;

    goto :goto_1c

    :cond_1b
    const/4 p1, 0x0

    :goto_1c
    iget-object p0, p0, Lz3l;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, p1}, Lcom/opera/android/BrowserActivity;->g1(Lp6l;)V

    return-void
.end method
