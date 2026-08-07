.class public final synthetic Ll/a5i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/b5i$a;


# direct methods
.method public synthetic constructor <init>(Ll/b5i$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a5i;->a:Ll/b5i$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a5i;->a:Ll/b5i$a;

    invoke-static {p0}, Ll/b5i$a;->a(Ll/b5i$a;)V

    return-void
.end method
