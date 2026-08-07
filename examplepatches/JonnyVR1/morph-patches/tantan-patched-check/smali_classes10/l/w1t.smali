.class public final synthetic Ll/w1t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/z1t;


# direct methods
.method public synthetic constructor <init>(Ll/z1t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w1t;->a:Ll/z1t;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w1t;->a:Ll/z1t;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/z1t;->L3(Ll/z1t;Ljava/lang/String;)V

    return-void
.end method
