.class public Ll/rt40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zgj0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/rt40$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/zgj0<",
        "TR;>;"
    }
.end annotation


# static fields
.field static final a:Ll/rt40;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/rt40<",
            "*>;"
        }
    .end annotation
.end field

.field private static final b:Ll/xhj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/xhj0<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/rt40;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/rt40;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/rt40;->a:Ll/rt40;

    .line 7
    .line 8
    new-instance v0, Ll/rt40$a;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/rt40$a;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/rt40;->b:Ll/xhj0;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b()Ll/xhj0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/xhj0<",
            "TR;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/rt40;->b:Ll/xhj0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/Object;Ll/zgj0$a;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
