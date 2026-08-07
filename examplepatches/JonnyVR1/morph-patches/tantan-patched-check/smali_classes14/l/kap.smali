.class public final synthetic Ll/kap;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/map;


# direct methods
.method public synthetic constructor <init>(Ll/map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kap;->a:Ll/map;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kap;->a:Ll/map;

    invoke-static {p0}, Ll/map;->n(Ll/map;)V

    return-void
.end method
