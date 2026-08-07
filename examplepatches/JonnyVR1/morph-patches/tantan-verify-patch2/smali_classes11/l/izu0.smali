.class public final synthetic Ll/izu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jzu0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/jzu0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/izu0;->a:Ll/jzu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/izu0;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/izu0;->a:Ll/jzu0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jzu0;->a:Ll/lzu0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/izu0;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, p0}, Ll/lzu0;->j(Ll/lzu0;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
