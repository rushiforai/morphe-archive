.class public final synthetic Ll/t3q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/y20;

.field public final synthetic d:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ll/y20;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t3q0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/t3q0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/t3q0;->c:Ll/y20;

    iput-object p4, p0, Ll/t3q0;->d:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t3q0;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/t3q0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/t3q0;->c:Ll/y20;

    iget-object p0, p0, Ll/t3q0;->d:Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, p0}, Ll/v3q0;->e3(Ljava/lang/String;Ljava/lang/String;Ll/y20;Ljava/lang/Runnable;)V

    return-void
.end method
