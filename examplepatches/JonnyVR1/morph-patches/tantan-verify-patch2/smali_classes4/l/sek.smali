.class public final synthetic Ll/sek;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xek;


# direct methods
.method public synthetic constructor <init>(Ll/xek;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sek;->a:Ll/xek;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sek;->a:Ll/xek;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/xek;->i0(Ll/xek;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
