.class public final synthetic Ll/yyj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ezj;


# direct methods
.method public synthetic constructor <init>(Ll/ezj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yyj;->a:Ll/ezj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yyj;->a:Ll/ezj;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/ezj;->P3(Ll/ezj;Ljava/lang/Throwable;)V

    return-void
.end method
