.class public final synthetic Ll/r5y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/s5y;


# direct methods
.method public synthetic constructor <init>(Ll/s5y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r5y;->a:Ll/s5y;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5y;->a:Ll/s5y;

    check-cast p1, Lkotlin/Triple;

    invoke-static {p0, p1}, Ll/s5y;->c(Ll/s5y;Lkotlin/Triple;)V

    return-void
.end method
