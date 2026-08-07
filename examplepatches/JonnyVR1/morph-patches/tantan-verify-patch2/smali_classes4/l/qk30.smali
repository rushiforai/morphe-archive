.class public final synthetic Ll/qk30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mk30$e;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/mk30$e;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qk30;->a:Ll/mk30$e;

    iput-object p2, p0, Ll/qk30;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qk30;->a:Ll/mk30$e;

    iget-object p0, p0, Ll/qk30;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/mk30$e;->F(Ll/mk30$e;Ljava/lang/String;)V

    return-void
.end method
