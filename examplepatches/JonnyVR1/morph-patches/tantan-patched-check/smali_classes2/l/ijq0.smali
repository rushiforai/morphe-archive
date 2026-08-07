.class public final synthetic Ll/ijq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jjq0$c;

.field public final synthetic b:Ll/jjq0;


# direct methods
.method public synthetic constructor <init>(Ll/jjq0$c;Ll/jjq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ijq0;->a:Ll/jjq0$c;

    iput-object p2, p0, Ll/ijq0;->b:Ll/jjq0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ijq0;->a:Ll/jjq0$c;

    iget-object p0, p0, Ll/ijq0;->b:Ll/jjq0;

    invoke-static {v0, p0}, Ll/jjq0;->a(Ll/jjq0$c;Ll/jjq0;)V

    return-void
.end method
