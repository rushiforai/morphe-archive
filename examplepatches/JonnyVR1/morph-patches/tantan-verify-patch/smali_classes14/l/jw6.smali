.class public final synthetic Ll/jw6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/sw6;


# direct methods
.method public synthetic constructor <init>(Ll/sw6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jw6;->a:Ll/sw6;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jw6;->a:Ll/sw6;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/sw6;->j3(Ll/sw6;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
