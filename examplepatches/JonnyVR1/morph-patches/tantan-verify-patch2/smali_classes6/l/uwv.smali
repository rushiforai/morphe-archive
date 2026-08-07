.class public final synthetic Ll/uwv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/vwv;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/Exception;


# direct methods
.method public synthetic constructor <init>(Ll/vwv;Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uwv;->a:Ll/vwv;

    iput-object p2, p0, Ll/uwv;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/uwv;->c:Ljava/lang/Exception;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uwv;->a:Ll/vwv;

    iget-object v1, p0, Ll/uwv;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/uwv;->c:Ljava/lang/Exception;

    invoke-static {v0, v1, p0}, Ll/vwv;->k(Ll/vwv;Ljava/lang/String;Ljava/lang/Exception;)V

    return-void
.end method
