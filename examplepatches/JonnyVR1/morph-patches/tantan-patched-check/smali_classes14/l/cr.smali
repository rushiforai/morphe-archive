.class public final synthetic Ll/cr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/dr;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/Exception;


# direct methods
.method public synthetic constructor <init>(Ll/dr;Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cr;->a:Ll/dr;

    iput-object p2, p0, Ll/cr;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/cr;->c:Ljava/lang/Exception;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cr;->a:Ll/dr;

    iget-object v1, p0, Ll/cr;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/cr;->c:Ljava/lang/Exception;

    invoke-static {v0, v1, p0}, Ll/dr;->d(Ll/dr;Ljava/lang/String;Ljava/lang/Exception;)V

    return-void
.end method
