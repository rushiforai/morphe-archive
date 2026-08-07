.class public final synthetic Ll/ng80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qg80;


# direct methods
.method public synthetic constructor <init>(Ll/qg80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ng80;->a:Ll/qg80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ng80;->a:Ll/qg80;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/qg80;->N3(Ll/qg80;Landroid/net/NetworkInfo;)V

    return-void
.end method
