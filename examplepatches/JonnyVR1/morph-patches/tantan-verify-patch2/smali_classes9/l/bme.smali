.class public final synthetic Ll/bme;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hme;


# direct methods
.method public synthetic constructor <init>(Ll/hme;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bme;->a:Ll/hme;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bme;->a:Ll/hme;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/hme;->b0(Ll/hme;Ljava/lang/String;)V

    return-void
.end method
