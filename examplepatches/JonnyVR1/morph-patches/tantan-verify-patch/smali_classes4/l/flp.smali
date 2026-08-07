.class public final synthetic Ll/flp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hlp$a;


# direct methods
.method public synthetic constructor <init>(Ll/hlp$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/flp;->a:Ll/hlp$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/flp;->a:Ll/hlp$a;

    invoke-static {p0}, Ll/hlp$a;->b(Ll/hlp$a;)V

    return-void
.end method
