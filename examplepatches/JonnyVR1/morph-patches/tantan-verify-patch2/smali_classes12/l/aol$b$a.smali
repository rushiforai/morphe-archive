.class Ll/aol$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/aol$b;->onError(ILjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/aol$b;


# direct methods
.method public constructor <init>(Ll/aol$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aol$b$a;->a:Ll/aol$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/aol$b$a;->a:Ll/aol$b;

    .line 2
    .line 3
    iget-object v0, p0, Ll/aol$b;->b:Ll/aol;

    .line 4
    .line 5
    iget-object p0, p0, Ll/aol$b;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 6
    .line 7
    invoke-static {v0, p0}, Ll/aol;->b(Ll/aol;Ljava/util/concurrent/ConcurrentHashMap;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
