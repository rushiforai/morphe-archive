.class public final synthetic Ll/gxy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nxy0;


# instance fields
.field public final synthetic a:Ll/sqr0;


# direct methods
.method public synthetic constructor <init>(Ll/sqr0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gxy0;->a:Ll/sqr0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)I
    .locals 1

    .line 1
    check-cast p1, Ll/hwy0;

    .line 2
    .line 3
    sget-object v0, Ll/oxy0;->a:Ljava/util/regex/Pattern;

    .line 4
    .line 5
    iget-object p0, p0, Ll/gxy0;->a:Ll/sqr0;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/hwy0;->d(Ll/sqr0;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method
