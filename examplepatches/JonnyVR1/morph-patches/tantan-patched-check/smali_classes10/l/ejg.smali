.class public final synthetic Ll/ejg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fjg;


# direct methods
.method public synthetic constructor <init>(Ll/fjg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ejg;->a:Ll/fjg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ejg;->a:Ll/fjg;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/fjg;->W3(Ll/fjg;Ljava/lang/Throwable;)V

    return-void
.end method
