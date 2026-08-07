.class public final synthetic Ll/lzz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qzz;


# direct methods
.method public synthetic constructor <init>(Ll/qzz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lzz;->a:Ll/qzz;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lzz;->a:Ll/qzz;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/qzz;->E(Ll/qzz;Ljava/lang/String;)V

    return-void
.end method
