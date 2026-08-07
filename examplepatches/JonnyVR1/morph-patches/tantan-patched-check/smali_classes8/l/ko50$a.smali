.class public Ll/ko50$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vk90;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ko50;->a(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ko50$b;

.field public final synthetic b:Ll/ko50;


# direct methods
.method public constructor <init>(Ll/ko50;Ll/ko50$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ko50$a;->b:Ll/ko50;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ko50$a;->a:Ll/ko50$b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ko50$a;->a:Ll/ko50$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ko50$b;->g(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
