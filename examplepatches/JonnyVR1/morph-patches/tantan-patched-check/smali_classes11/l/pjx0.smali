.class public abstract Ll/pjx0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/pjx0;

.field public static final b:Ll/pjx0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/ljx0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/ljx0;-><init>(Ll/kjx0;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/pjx0;->a:Ll/pjx0;

    .line 8
    .line 9
    new-instance v0, Ll/njx0;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ll/njx0;-><init>(Ll/mjx0;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/pjx0;->b:Ll/pjx0;

    .line 15
    .line 16
    return-void
.end method

.method public synthetic constructor <init>(Ll/ojx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static d()Ll/pjx0;
    .locals 1

    .line 1
    sget-object v0, Ll/pjx0;->a:Ll/pjx0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static e()Ll/pjx0;
    .locals 1

    .line 1
    sget-object v0, Ll/pjx0;->b:Ll/pjx0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public abstract a(Ljava/lang/Object;J)Ljava/util/List;
.end method

.method public abstract b(Ljava/lang/Object;J)V
.end method

.method public abstract c(Ljava/lang/Object;Ljava/lang/Object;J)V
.end method
