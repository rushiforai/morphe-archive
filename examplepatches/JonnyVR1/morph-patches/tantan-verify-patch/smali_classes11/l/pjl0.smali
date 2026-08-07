.class public final synthetic Ll/pjl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wjl0$a;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/wjl0$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pjl0;->a:Ll/wjl0$a;

    iput-object p2, p0, Ll/pjl0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pjl0;->a:Ll/wjl0$a;

    iget-object p0, p0, Ll/pjl0;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/wjl0$a;->j(Ll/wjl0$a;Ljava/lang/String;)V

    return-void
.end method
