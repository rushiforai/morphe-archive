.class public final Ll/c40;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/c40$a;,
        Ll/c40$b;
    }
.end annotation


# static fields
.field public static final a:Ll/c40$b;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/c40$b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/c40$b;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/c40;->a:Ll/c40$b;

    .line 7
    .line 8
    return-void
.end method

.method public static a()Ll/c40$b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T0:",
            "Ljava/lang/Object;",
            "T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "T8:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/c40$b<",
            "TT0;TT1;TT2;TT3;TT4;TT5;TT6;TT7;TT8;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/c40;->a:Ll/c40$b;

    .line 2
    .line 3
    return-object v0
.end method

.method public static b(Ll/x20;)Ll/y20;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/x20;",
            ")",
            "Ll/y20<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/c40$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/c40$a;-><init>(Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
