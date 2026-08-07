.class public final synthetic Ll/fjs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hjs;

.field public final synthetic b:Ll/hjs$a;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/hjs;Ll/hjs$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fjs;->a:Ll/hjs;

    iput-object p2, p0, Ll/fjs;->b:Ll/hjs$a;

    iput-object p3, p0, Ll/fjs;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fjs;->a:Ll/hjs;

    iget-object v1, p0, Ll/fjs;->b:Ll/hjs$a;

    iget-object p0, p0, Ll/fjs;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/hjs$a;->e(Ll/hjs;Ll/hjs$a;Ljava/lang/String;)V

    return-void
.end method
