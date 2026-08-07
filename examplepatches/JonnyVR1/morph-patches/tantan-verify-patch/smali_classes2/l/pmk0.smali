.class public final synthetic Ll/pmk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/GraphRequest$b;


# instance fields
.field public final synthetic a:Lcom/facebook/internal/e$a;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/internal/e$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pmk0;->a:Lcom/facebook/internal/e$a;

    iput-object p2, p0, Ll/pmk0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Lcom/facebook/GraphResponse;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pmk0;->a:Lcom/facebook/internal/e$a;

    iget-object p0, p0, Ll/pmk0;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/facebook/internal/e;->a(Lcom/facebook/internal/e$a;Ljava/lang/String;Lcom/facebook/GraphResponse;)V

    return-void
.end method
