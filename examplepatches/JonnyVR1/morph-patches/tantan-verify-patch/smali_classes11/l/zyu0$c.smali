.class public final Ll/zyu0$c;
.super Ll/rru0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zyu0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public final a:Ll/y0y0;


# direct methods
.method public constructor <init>(Ll/y0y0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rru0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zyu0$c;->a:Ll/y0y0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final G3(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zyu0$c;->a:Ll/y0y0;

    .line 2
    .line 3
    invoke-interface/range {p0 .. p5}, Ll/y0y0;->a(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zza()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zyu0$c;->a:Ll/y0y0;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
