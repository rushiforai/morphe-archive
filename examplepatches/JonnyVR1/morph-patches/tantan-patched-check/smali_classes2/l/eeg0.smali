.class public final Ll/eeg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field public final a:Ll/feg0;

.field public final b:Ll/kxg0;

.field public c:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/eeg0;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ll/feg0;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/eeg0;->a:Ll/feg0;

    .line 5
    .line 6
    new-instance p1, Ll/kxg0;

    .line 7
    .line 8
    invoke-direct {p1, p2}, Ll/kxg0;-><init>(Landroid/net/Uri;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/eeg0;->b:Ll/kxg0;

    .line 12
    .line 13
    return-void
.end method
