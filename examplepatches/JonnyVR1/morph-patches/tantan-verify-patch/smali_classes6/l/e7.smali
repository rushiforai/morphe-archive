.class public abstract Ll/e7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/i3i;


# instance fields
.field public a:Ll/t4i;

.field public b:Ll/e7;


# direct methods
.method public constructor <init>(Ll/t4i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e7;->a:Ll/t4i;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public e(Ll/e7;)Ll/e7;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :cond_0
    iput-object p1, p0, Ll/e7;->b:Ll/e7;

    .line 5
    .line 6
    return-object p1
.end method
