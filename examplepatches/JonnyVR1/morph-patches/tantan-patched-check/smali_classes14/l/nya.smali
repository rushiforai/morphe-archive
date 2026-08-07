.class public final synthetic Ll/nya;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cza;


# direct methods
.method public synthetic constructor <init>(Ll/cza;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nya;->a:Ll/cza;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nya;->a:Ll/cza;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/cza;->g3(Ll/cza;Ljava/lang/Throwable;)V

    return-void
.end method
