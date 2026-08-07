.class public abstract Ll/g6e;
.super Ll/w1e;
.source "SourceFile"


# static fields
.field public static final a:Lcom/p1/mobile/android/app/Dialog$f;

.field public static final b:Lcom/p1/mobile/android/app/Dialog$f;

.field public static final c:Lcom/p1/mobile/android/app/Dialog$f;

.field public static final d:Lcom/p1/mobile/android/app/Dialog$f;

.field public static final e:Lcom/p1/mobile/android/app/Dialog$f;

.field public static final f:Lcom/p1/mobile/android/app/Dialog$f;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/g6e$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/g6e$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/g6e;->a:Lcom/p1/mobile/android/app/Dialog$f;

    .line 7
    .line 8
    new-instance v0, Ll/g6e$b;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/g6e$b;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/g6e;->b:Lcom/p1/mobile/android/app/Dialog$f;

    .line 14
    .line 15
    new-instance v0, Ll/g6e$c;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/g6e$c;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Ll/g6e;->c:Lcom/p1/mobile/android/app/Dialog$f;

    .line 21
    .line 22
    new-instance v0, Ll/g6e$d;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/g6e$d;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Ll/g6e;->d:Lcom/p1/mobile/android/app/Dialog$f;

    .line 28
    .line 29
    new-instance v0, Ll/g6e$e;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/g6e$e;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object v0, Ll/g6e;->e:Lcom/p1/mobile/android/app/Dialog$f;

    .line 35
    .line 36
    new-instance v0, Ll/g6e$f;

    .line 37
    .line 38
    invoke-direct {v0}, Ll/g6e$f;-><init>()V

    .line 39
    .line 40
    .line 41
    sput-object v0, Ll/g6e;->f:Lcom/p1/mobile/android/app/Dialog$f;

    .line 42
    .line 43
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/w1e;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Dialog$e;->u0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 23
    .line 24
    .line 25
    return-void
.end method
